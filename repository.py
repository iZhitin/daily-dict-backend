from sqlalchemy import select

from database import new_session, TaskOrm
from schemas import STaskAdd, STask


class TaskRepository:
    @classmethod
    async def add_one(cls, data: STaskAdd) -> int:
        async with new_session() as session:  # объект сессии работает с транзакцией
            task_dict = data.model_dump()

            task = TaskOrm(**task_dict)
            session.add(task)  # добавляем объект в сессию
            await session.flush()  # еще не совершит изменения, но отправит в базу (все до транзакции)
            await session.commit()  # сессия отправляет все добавленные изменения (транзакция)
            return task.id

    @classmethod
    async def find_all(cls) -> list[STask]:
        async with new_session() as session:  # объект сессии работает с транзакцией
            query = select(TaskOrm)
            result = await session.execute(query)
            task_models = result.scalars().all()  # итератор
            task_schemas = [STask.model_validate(task_model) for task_model in task_models]
            return task_schemas  # task_models
