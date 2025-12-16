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
   * 自分のデッキを取得
   */
  @route("/cards")
  @get
  @summary("カード一覧取得")
  op getCards(): Body<{
    cards: Card[];
  }>;
  /**
   * デッキにないカードも取得できる
   */
  @route("/cards/{id}")
  @get
  @summary("指定したカード取得")
  op getCard(@path id: string): Body<{
    card: Card;
  }>;
  @route("/cards")
  @post
  @summary("カードをデッキに追加")
  op addCardToDeck(@body id: string): Body<{
    card: Card;
  }>;
  @route("/cards/{id}")
  @delete
  @summary("カードをデッキから削除")
  op removeCardFromDeck(@path id: string): Body<{
    card: Card;
  }>;
  @route("/stats/{id}")
  @get
  @summary("ユーザーの統計情報取得")
  op getUserStats(@path id: string): Body<{
    stats: UserStats;
  }>;
  @route("/stats/me")
  @get
  @summary("自分の統計情報取得")
  op getMyStats(): Body<{
    stats: UserStats;
  }>;
  @route("/communities")
  @get
  @summary("コミュニティ一覧取得")
  op getCommunities(): Body<{
    communities: Community[];
  }>;
  @route("/communities/{id}")
  @get
  @summary("指定したコミュニティ取得")
  op getCommunity(@path id: string): Body<{
    community: Community;
  }>;
  @route("/communities/{id}/cards")
  @get
  @summary("指定したコミュニティのカード一覧取得")
  op getCommunityCards(@path id: string): Body<{
    cards: Card[];
  }>;
  @route("/communities")
  @post
  @summary("コミュニティを作成")
  op createCommunity(@body name: string): Body<{
    community: Community;
  }>;
  @route("/communities/{id}")
  @delete
  @summary("コミュニティを削除")
  op deleteCommunity(@path id: string): Body<{
    community: Community;
  }>;
  @route("/communities/{id}/cards")
  @post
  @summary("指定したコミュニティにカードを追加")
  op addCardToCommunity(@path id: string, @body card: Card): Body<{
    card: Card;
  }>;
  @route("/communities/{id}/cards/{cardId}")
  @delete
  @summary("指定したコミュニティのカードを削除")
  op removeCardFromCommunity(@path id: string, @path cardId: string): Body<{
    card: Card;
  }>;
}
