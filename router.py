from typing import Annotated
from fastapi import Depends, APIRouter
from schemas import STaskAdd, STask, STaskId
from repository import TaskRepository

router = APIRouter(
    prefix="/tasks",
    tags=["Таски"]
)

# @app.get("/home")
# def get_home():
#     return "Hello world"


# Простая ручка
# @app.get("/tasks")
# def get_tasks():
#     task = Task(name="Запиши это видео")
#     return {"data": task}


@router.post("")
async def add_task(
        task: Annotated[STaskAdd, Depends()]

) -> STaskId:
    task_id = await TaskRepository.add_one(task)
    return {"task_id": task_id}  # STaskId(task_id=task_id)


@router.get("")
async def get_tasks() -> list[STask]:  # аннотируем здесь, что в доке была схема успешного запроса
    tasks = await TaskRepository.find_all()
    return tasks  # {"tasks": tasks}



