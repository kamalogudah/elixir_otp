# c("basic.ex")
# {:ok, basic_pid} = Basic.start_link
# Basic.get_the_state(basic_pid) or =>  "Hello"
#  GenServer.call(basic_pid, {:get_the_state}) =>  "Hello"
defmodule Basic do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, "Hello")
  end

  def init(initial_data) do
    greetings = %{:greeting => initial_data}
    {:ok, initial_data}
  end

  def get_the_state(process_id) do
    GenServer.call(process_id, {:get_the_state})
  end

  def handle_call({:get_the_state}, _from, my_state) do
    {:reply, my_state, my_state}
  end
end
