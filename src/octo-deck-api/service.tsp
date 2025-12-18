import "@typespec/http";
import "@typespec/openapi";
import "./models.tsp";

using Http;
using OpenAPI;

@service(#{ title: "Octo Deck API" })
@info(#{ version: "1.0.0" })
@server("https://api.octodeck.furari.co", "Production")
@server("https://stg.api.octodeck.furari.co", "Staging")
@server("https://dev.api.octodeck.furari.co", "Development")
@server("http://localhost:8080", "Local")
@useAuth(BearerAuth)
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
  @route("/cards/{githubId}")
  @get
  @summary("指定したカード取得")
  op getCard(@path githubId: string): Body<{
    card: Card;
  }>;
  @route("/cards/me")
  @get
  @summary("自分のカード取得")
  op getMyCard(): Body<{
    card: Card;
  }>;
  @route("/cards")
  @post
  @summary("カードをデッキに追加")
  op addCardToDeck(@body githubId: string): Body<{
    card: Card;
  }>;
  @route("/cards/{githubId}")
  @delete
  @summary("カードをデッキから削除")
  op removeCardFromDeck(@path githubId: string): Body<{
    card: Card;
  }>;
  @route("/stats/{githubId}")
  @get
  @summary("ユーザーの統計情報取得")
  op getUserStats(@path githubId: string): Body<{
    stats: UserStats;
  }>;
  @route("/stats/me")
  @get
  @summary("自分の統計情報取得")
  op getMyStats(): Body<{
    stats: UserStats;
  }>;
  /**
   * 自分が入っているコミュニティ一覧取得
   */
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
    highlightedCard: HighlightedCard;
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
  @summary("指定したコミュニティに自分のカードを追加")
  op addCardToCommunity(@path id: string): Body<{
    card: Card;
  }>;
  @route("/communities/{id}/cards")
  @delete
  @summary("指定したコミュニティの自分のカードを削除")
  op removeCardFromCommunity(@path id: string): Body<{
    card: Card;
  }>;
}
