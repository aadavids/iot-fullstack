defmodule IotHeartbeat.Heartbeats do
  @moduledoc """
  The Heartbeats context.
  """

  import Ecto.Query, warn: false
  alias IotHeartbeat.Repo

  alias IotHeartbeat.Heartbeats.Heartbeat

  @doc """
  Returns the list of heartbeats.

  ## Examples

      iex> list_heartbeats()
      [%Heartbeat{}, ...]

  """
  def list_heartbeats do
    Repo.all(Heartbeat)
  end

  @doc """
  List heartbeats for LiveView.
  """
  def live_heartbeats do
    query = from h in Heartbeat, order_by: [desc: h.inserted_at]

    Repo.all(query)
  end

  @doc """
  Gets a single heartbeat.

  Raises `Ecto.NoResultsError` if the Heartbeat does not exist.

  ## Examples

      iex> get_heartbeat!(123)
      %Heartbeat{}

      iex> get_heartbeat!(456)
      ** (Ecto.NoResultsError)

  """
  def get_heartbeat!(id), do: Repo.get!(Heartbeat, id)

  @doc """
  Creates a heartbeat.

  ## Examples

      iex> create_heartbeat(%{field: value})
      {:ok, %Heartbeat{}}

      iex> create_heartbeat(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_heartbeat(attrs) do
    %Heartbeat{} |> Heartbeat.changeset(attrs) |> Repo.insert()
  end

  @doc """
  Updates a heartbeat.

  ## Examples

      iex> update_heartbeat(heartbeat, %{field: new_value})
      {:ok, %Heartbeat{}}

      iex> update_heartbeat(heartbeat, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_heartbeat(%Heartbeat{} = heartbeat, attrs) do
    heartbeat
    |> Heartbeat.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a heartbeat.

  ## Examples

      iex> delete_heartbeat(heartbeat)
      {:ok, %Heartbeat{}}

      iex> delete_heartbeat(heartbeat)
      {:error, %Ecto.Changeset{}}

  """
  def delete_heartbeat(%Heartbeat{} = heartbeat) do
    Repo.delete(heartbeat)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking heartbeat changes.

  ## Examples

      iex> change_heartbeat(heartbeat)
      %Ecto.Changeset{data: %Heartbeat{}}

  """
  def change_heartbeat(%Heartbeat{} = heartbeat, attrs \\ %{}) do
    Heartbeat.changeset(heartbeat, attrs)
  end
end
