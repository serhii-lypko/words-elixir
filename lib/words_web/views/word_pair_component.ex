defmodule WordsWeb.WordPairComponent do
  use Phoenix.Component


  def button(assigns) do
    ~H"""
    <button class="btn">
      <%= render_slot(@inner_block) %>
    </button>
    """
  end


  def greet(assigns) do
    ~H"""
    <p {@rest}>Hello </p>
    """
  end


  def unordered_list(assigns) do
    ~H"""
    <ul>
      <%= for pair <- @pairs do %>
        <div x-data="{ open: false }">
            <div x-on:click="open = ! open">
                <span><%= pair.eng %></span>
            </div>

            <div x-show="open">
                <span><%= pair.ru %></span>

                <%!-- <a href="/hello">world</a> --%>

                <%!-- <%=link(
                    get_inverted_status_text(pair.learned),
                    to: "/#{pair.id}",
                    method: :patch)
                %> --%>
            </div>
        </div>
      <% end %>
    </ul>
    """
  end


  # def unordered_list(assigns) do
  #   ~H"""
  #   <ul>
  #     <%= for pair <- @pairs do %>
  #       <div x-data="{ open: false }">
  #           <div x-on:click="open = ! open">
  #               <span><%= pair.eng %></span>
  #           </div>

  #           <div x-show="open">
  #               <span><%= pair.ru %></span>
  #               <%=link(
  #                   get_inverted_status_text(pair.learned),
  #                   to: "/#{pair.id}",
  #                   method: :patch)
  #               %>
  #           </div>
  #       </div>
  #       <hr/>
  #     <% end %>
  #   </ul>
  #   """
  # end




end
