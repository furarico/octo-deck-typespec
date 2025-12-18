namespace OctoDeckApi {
  model Card {
    githubId: string;
    userName: string;
    fullName: string;
    iconUrl: string;
    identicon: Identicon;
    mostUsedLanguage: Language;
  }
  model Language {
    /**
     * 言語名
     */
    name: string;

    /**
     * カラーコード 例: #RRGGBB
     */
    color: string;
  }
  model Identicon {
    /**
     * カラーコード 例: #RRGGBB
     */
    color: string;

    /**
     * 5x5の二次元配列。trueがブロック
     */
    blocks: boolean[][];
  }
  model Contribution {
    date: plainDate;
    count: int32;
  }
  model UserStats {
    contributions: Contribution[];
  }
  model Community {
    id: string;
    name: string;
  }
  model HighlightedCard {
    bestReviewer: Card;
    bestContributor: Card;
    bestCommitter: Card;
    bestPullRequester: Card;
    bestIssuer: Card;
  }
}
