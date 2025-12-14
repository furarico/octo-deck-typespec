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
  @route("/octo-deck")
  @get
  @summary("カード一覧取得")
  op getCards(): Body<{
    cards: Card[];
  }>;
}
