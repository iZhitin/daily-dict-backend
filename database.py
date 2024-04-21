from typing import Optional

from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column
import asyncpg
import os

# engine = create_async_engine(
#     "sqlite+aiosqlite:///tasks.db"  # можно развернуть на сервере
# )

# DATABASE_URL = "postgresql://user:password@host:port/database"
external_ip = os.environ.get("127.0.0.1")
DATABASE_URL = f"postgresql+asyncpg://izhitin:Qwerty_386@{external_ip}:5432/dd_db"

engine = create_async_engine(DATABASE_URL)

new_session = async_sessionmaker(engine, expire_on_commit=False)


class Model(DeclarativeBase):
    pass


class TaskOrm(Model):
    __tablename__ = "tasks"

    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str]
    description: Mapped[Optional[str]]


async def create_tables():
    async with engine.begin() as conn:
        await conn.run_sync(Model.metadata.create_all)


async def delete_tables():
    async with engine.begin() as conn:
        await conn.run_sync(Model.metadata.drop_all)
