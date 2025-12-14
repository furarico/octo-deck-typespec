import "@typespec/http";
import "@typespec/openapi";
import "./models.tsp";

using Http;
using OpenAPI;

@service(#{ title: "Octo Deck API" })
@info(#{ version: "1.0.0" })
@server("https://api.octo-deck.furari.co", "Production")
@server("https://stg.api.octo-deck.furari.co", "Staging")
@server("https://dev.api.octo-deck.furari.co", "Development")
@server("http://localhost:8080", "Local")
namespace OctoDeckApi {
  /**
   * Octo Deck API
   */
  @route("/cards")
  @get
  @summary("カード一覧取得")
  op getCards(): Body<{
    cards: Card[];
  }>;
  @route("/cards/{id}")
  @get
  @summary("カード取得")
  op getCard(@path id: string): Body<{
    card: Card;
  }>;
  @route("/cards/me")
  @get
  @summary("自分のカード取得")
  op getMyCard(): Body<{
    card: Card;
  }>;
}
